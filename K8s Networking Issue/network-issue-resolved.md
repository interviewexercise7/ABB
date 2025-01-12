# AKS Network Issue Investigation and Resolution Report
## Issue: Pod External Service Communication Failure

### Executive Summary
This document details the investigation and resolution of network connectivity issues where pods in our AKS cluster were unable to communicate with external services. The root cause was identified as a DNS resolution issue combined with incorrect Network Security Group (NSG) rules.

### Initial Symptoms
- Pods unable to reach external endpoints
- Connection timeouts in application logs
- DNS resolution failures
- Intermittent service disruptions

### Investigation Steps

#### 1. Pod Network Connectivity Verification
```bash
# Verify DNS resolution from affected pod
kubectl exec -it <pod-name> -- nslookup kubernetes.default
kubectl exec -it <pod-name> -- nslookup google.com

# Check pod networking configuration
kubectl describe pod <pod-name>
kubectl get pod <pod-name> -o yaml

# Test network connectivity
kubectl exec -it <pod-name> -- curl -v telnet://external-service:443
```

#### 2. DNS Configuration Check
```bash
# Verify CoreDNS pods status
kubectl get pods -n kube-system -l k8s-app=kube-dns
kubectl logs -n kube-system -l k8s-app=kube-dns

# Check CoreDNS configuration
kubectl get configmap coredns -n kube-system -o yaml
```

#### 3. Network Policy Analysis
```bash
# List network policies
kubectl get networkpolicies --all-namespaces

# Analyze network policy rules
kubectl describe networkpolicy <policy-name> -n <namespace>
```

#### 4. Azure Network Configuration
```bash
# Check NSG rules
az network nsg rule list --resource-group <rg-name> --nsg-name <nsg-name>

# Verify route tables
az network route-table route list --resource-group <rg-name> --route-table-name <rt-name>

# Check UDR configuration
az network vnet subnet show -g <rg-name> --vnet-name <vnet-name> -n <subnet-name>
```

### Root Cause Analysis

1. **Primary Issues Identified:**
   - Restrictive NSG rules blocking outbound traffic
   - CoreDNS configuration issues
   - Incorrect routing table entries

2. **Contributing Factors:**
   - Recent network policy changes
   - DNS cache pollution
   - Misconfigured pod security policies

### Resolution Steps

1. **NSG Configuration Update**
```bash
# Update NSG rules to allow required outbound traffic
az network nsg rule create \
    --resource-group <rg-name> \
    --nsg-name <nsg-name> \
    --name AllowInternetOutbound \
    --priority 100 \
    --direction Outbound \
    --access Allow \
    --protocol * \
    --source-address-prefixes VirtualNetwork \
    --source-port-ranges * \
    --destination-address-prefixes Internet \
    --destination-port-ranges *
```

2. **CoreDNS Configuration Fix**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: coredns
  namespace: kube-system
data:
  Corefile: |
    .:53 {
        errors
        health
        kubernetes cluster.local in-addr.arpa ip6.arpa {
            pods insecure
            upstream
            fallthrough in-addr.arpa ip6.arpa
        }
        prometheus :9153
        forward . /etc/resolv.conf
        cache 30
        loop
        reload
        loadbalance
    }
```

3. **Network Policy Updates**
```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-external-traffic
  namespace: <namespace>
spec:
  podSelector: {}
  policyTypes:
  - Egress
  egress:
  - to:
    - ipBlock:
        cidr: 0.0.0.0/0
        except:
        - 169.254.0.0/16
        - 172.16.0.0/12
    ports:
    - protocol: TCP
      port: 443
    - protocol: TCP
      port: 80
```

### Verification Steps

1. **Test External Connectivity**
```bash
# Test DNS resolution
kubectl exec -it <pod-name> -- nslookup external-service.com

# Test HTTPS connectivity
kubectl exec -it <pod-name> -- curl -v https://external-service.com

# Verify pod logs
kubectl logs <pod-name> --tail=100
```

2. **Monitor Network Traffic**
```bash
# Check for blocked traffic in NSG logs
az network watcher flow-log show --resource-group <rg-name> --nsg-name <nsg-name>

# Monitor pod networking events
kubectl get events --field-selector type=Warning
```

### Preventive Measures

1. **Monitoring Implementation**
   - Set up network flow logs
   - Configure NSG diagnostics
   - Implement pod connectivity monitoring
   - Set up alerts for DNS failures

2. **Documentation Updates**
   - Update network architecture diagrams
   - Document NSG rule changes
   - Update runbooks with new troubleshooting steps

3. **Process Improvements**
   - Implement change management for network policies
   - Create network validation tests
   - Set up regular network configuration audits

### Best Practices Recommendations

1. **Network Configuration**
   - Regular audit of NSG rules
   - Implement least-privilege access
   - Document all custom network policies
   - Use network policy templates

2. **Monitoring and Alerting**
   - Set up proactive monitoring
   - Configure network health checks
   - Implement automated testing
   - Create alert thresholds

3. **Maintenance Procedures**
   - Regular DNS cache clearing
   - Periodic network policy review
   - Scheduled configuration validation
   - Regular backup of network configurations

### Lessons Learned

1. **What Worked Well**
   - Systematic troubleshooting approach
   - Quick identification of DNS issues
   - Effective collaboration between teams

2. **Areas for Improvement**
   - Need for better network change documentation
   - Requirement for automated testing
   - Need for comprehensive network monitoring

### Contact Information

- Network Team: network-team@company.com
- AKS Support: aks-support@company.com
- Security Team: security-team@company.com

### References

1. Azure Documentation
   - [AKS Networking](https://docs.microsoft.com/en-us/azure/aks/concepts-network)
   - [NSG Configuration](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)

2. Kubernetes Documentation
   - [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
   - [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
