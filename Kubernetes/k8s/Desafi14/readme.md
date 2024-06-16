# Alien Tetris Kubernetes Deployment

## Descripción
Este proyecto despliega la aplicación Alien Tetris en un clúster de Kubernetes utilizando MicroK8s. Incluye la configuración de deployments, servicios y secretos necesarios.

## Instrucciones

### Requisitos
- MicroK8s instalado y configurado.

### Pasos para Desplegar

1. Clona este repositorio:
    ```bash
    git clone https://github.com/romancete85/eduit/blob/main/Kubernetes/k8s/Desafi14
    cd Desafio14
    ```

2. Aplica los manifiestos:
    ```bash
    kubectl apply -f secret.yaml
    kubectl apply -f configmap.yaml
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    ```

3. Verifica que los recursos se han creado correctamente:
    ```bash
    kubectl get pods
    kubectl get services
    ```

4. Accede a la aplicación mediante el navegador:
    Abre tu navegador y accede a la IP del servicio LoadBalancer que se muestra en el comando anterior.

## Enlaces
- [Repositorio de la Imagen Docker](https://hub.docker.com/r/romanfandrich/alien-tetris)
- [Repositorio de Código en GitHub](https://github.com/romancete85/eduit/edit/main/Kubernetes/k8s)
