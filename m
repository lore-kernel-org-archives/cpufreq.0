From: David Rientjes <rientjes@google.com>
Subject: Re: [RESEND PATCH] cpufreq: unnecesary double free in
 pcc_cpufreq_do_osc
Date: Thu, 30 Sep 2010 13:06:22 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1009301306020.9940@chino.kir.corp.google.com>
References: <1285875804.2180.1.camel@cowboy> <AANLkTikbSYutRGwQLU2srEQG6CO7pvXdFBQ0W216DoCv@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1285877188; bh=YzqM08vv/ANRcNSCYG/hQm0pKwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=Ry/gUCjeG2ZlWH1Y9byQy50dcwWNQpULC7Vbc190WzcpT2MTRaOVgTA0R0bMkfnSm
	 Zat5sgr5vWNB/PUpPOAkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:received:received:date:from:x-x-sender:to:cc
         :subject:in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=jv9g9P7Zp7NogOU+gtYnQNfz33A90c4CZCFFOCsdVvE=;
        b=furhYmBWmAyNs1kOzVoAJaKYx8JoFFdG6ot4IljlI3bGlzRlJn9fIesh8P2HhqliyV
         RsYUQo07EkftxtdhgDXg==
In-Reply-To: <AANLkTikbSYutRGwQLU2srEQG6CO7pvXdFBQ0W216DoCv@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@kernel.org>
Cc: dave@gnu.org, davej@redhat.com, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>

On Thu, 30 Sep 2010, Pekka Enberg wrote:

> From 8b18a51077c9e5b36d54a5e45f9058eb3aae2477 Mon Sep 17 00:00:00 2001
> From: Pekka Enberg <penberg@cs.helsinki.fi>
> Date: Thu, 30 Sep 2010 22:57:33 +0300
> Subject: [PATCH] x86, cpufreq: Fix pcc_cpufreq_do_osc() memory leaks
> 
> If acpi_evaluate_object() function call doesn't fail, we must kfree()
> output.buffer before returning from pcc_cpufreq_do_osc().
> 
> Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>

Acked-by: David Rientjes <rientjes@google.com>

> ---
>  arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c |   18 ++++++++++++------
>  1 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
> index 994230d..4f6f679 100644
> --- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
> +++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
> @@ -368,16 +368,22 @@ static int __init pcc_cpufreq_do_osc(acpi_handle *handle)
>  		return -ENODEV;
>  
>  	out_obj = output.pointer;
> -	if (out_obj->type != ACPI_TYPE_BUFFER)
> -		return -ENODEV;
> +	if (out_obj->type != ACPI_TYPE_BUFFER) {
> +		ret = -ENODEV;
> +		goto out_free;
> +	}
>  
>  	errors = *((u32 *)out_obj->buffer.pointer) & ~(1 << 0);
> -	if (errors)
> -		return -ENODEV;
> +	if (errors) {
> +		ret = -ENODEV;
> +		goto out_free;
> +	}
>  
>  	supported = *((u32 *)(out_obj->buffer.pointer + 4));
> -	if (!(supported & 0x1))
> -		return -ENODEV;
> +	if (!(supported & 0x1)) {
> +		ret = -ENODEV;
> +		goto out_free;
> +	}
>  
>  out_free:
>  	kfree(output.pointer);
> -- 
> 1.5.6.4
> 
