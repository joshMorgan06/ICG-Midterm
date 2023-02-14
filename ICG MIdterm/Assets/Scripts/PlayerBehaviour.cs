using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerBehaviour : MonoBehaviour
{
    public Material baseMat;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            baseMat.SetFloat("_RimPower", 0.5f);
            StartCoroutine(ResetRim());
        }
    }

    IEnumerator ResetRim()
    {
        yield return new WaitForSeconds(0.5f);
        baseMat.SetFloat("_RimPower", 15f);
    }
}
