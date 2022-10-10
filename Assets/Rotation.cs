using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotation : MonoBehaviour
{
    [SerializeField]
    private Vector3 _rotation;
    
    void Update()
    {
        transform.localEulerAngles += _rotation * Time.deltaTime;
    }
}