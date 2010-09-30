From: David Rientjes <rientjes@google.com>
Subject: Re: [RESEND PATCH] cpufreq: unnecesary double free in
 pcc_cpufreq_do_osc
Date: Thu, 30 Sep 2010 13:02:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1009301258550.9112@chino.kir.corp.google.com>
References: <1285875804.2180.1.camel@cowboy>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1285876991; bh=JHL/4OGSant2rTEoIVt0C0G7eZ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=UywgdVZ1kU/OVAH2I99/tR6kxJvXTeqV/ajUhaz2KE/2hjTwjlWnLhYW9x/TZ39vP
	 hnqEiZCNuYiWUh6XUYKFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:received:received:date:from:x-x-sender:to:cc
         :subject:in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=yYDUQULb+JyDeEgk94ZEQnpUTF7ygBMLaBrc5B/nMX4=;
        b=FR5NQ3Pf0QE1uvLG/Bo3v6PY6C0lvDyiTzZLih+x+nK+b6X7Qtw2ibsc6P+pzn0rUE
         s194IF6f/2JXOCtClcSg==
In-Reply-To: <1285875804.2180.1.camel@cowboy>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davidlohr Bueso <dave@gnu.org>
Cc: davej@redhat.com, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 30 Sep 2010, Davidlohr Bueso wrote:

> x86, cpufreq: avoid an unnecessary double free when finished in pcc_cpufreq_do_osc()
> 
> There is no need to fall through the out_free label thus saving a kfree call.
> 
> Signed-off-by: Davidlohr Bueso <dave@gnu.org>
> ---
>  arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
> index 994230d..db7dc35 100644
> --- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
> +++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
> @@ -379,6 +379,8 @@ static int __init pcc_cpufreq_do_osc(acpi_handle *handle)
>  	if (!(supported & 0x1))
>  		return -ENODEV;
>  
> +	return ret;
> +
>  out_free:
>  	kfree(output.pointer);
>  	return ret;

Why is the kfree() unnecessary?  acpi_evaluate_object() will allocate a 
new output.pointer if it returns 0, so at this point in the code you would 
now be leaking the buffer.

Instead, it would probably be better to fix the existing memory leaks in 
that function where we return -ENODEV without going to out_free when 
output.length is non-zero.
