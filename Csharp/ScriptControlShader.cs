using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]

public class ScriptControlShader : MonoBehaviour {

	private Renderer _renderer;
	
	// Use this for initialization
	void Start () {
		_renderer = GetComponent<Renderer>();
	}
	
	// Update is called once per frame
	void Update () {
		_renderer.sharedMaterial.SetColor("_Color", new Color(0, 1, 1, 1.0f));
	}
}
