using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMovement : MonoBehaviour
{
    public List<Transform> points;

    int index;

    [Range(0.0f, 1.0f)]
    public float time = 0.0f;

    // Update is called once per frame
    void Update()
    {
        float t = time / 5.0f;
        Vector3 start = points[index].position;
        Vector3 destination = points[(index + 1) % points.Count].position;
        transform.position = Vector3.Lerp(start, destination, t);

        time += Time.deltaTime;
        if (time >= 5.0f)
        {
            time = 0.0f;
            ++index;
            index %= points.Count;
        }
    }
}
