From: Dave Jones <davej@redhat.com>
Subject: Re: [RESEND PATCH] cpufreq: unnecesary double free in
 pcc_cpufreq_do_osc
Date: Thu, 30 Sep 2010 16:08:51 -0400
Message-ID: <20100930200850.GB4120@redhat.com>
References: <1285875804.2180.1.camel@cowboy>
 <alpine.DEB.2.00.1009301258550.9112@chino.kir.corp.google.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1009301258550.9112@chino.kir.corp.google.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Rientjes <rientjes@google.com>
Cc: Davidlohr Bueso <dave@gnu.org>, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Sep 30, 2010 at 01:02:54PM -0700, David Rientjes wrote:
  > > index 994230d..db7dc35 100644
 > > --- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
 > > +++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
 > > @@ -379,6 +379,8 @@ static int __init pcc_cpufreq_do_osc(acpi_handle *handle)
 > >  	if (!(supported & 0x1))
 > >  		return -ENODEV;
 > >  
 > > +	return ret;
 > > +
 > >  out_free:
 > >  	kfree(output.pointer);
 > >  	return ret;
 > 
 > Why is the kfree() unnecessary?  acpi_evaluate_object() will allocate a 
 > new output.pointer if it returns 0, so at this point in the code you would 
 > now be leaking the buffer.
 > 
 > Instead, it would probably be better to fix the existing memory leaks in 
 > that function where we return -ENODEV without going to out_free when 
 > output.length is non-zero.

Oh, *duh*. That was subtle.
You, and Pekka are of course correct.  I'll merge up Pekka's patch.

thanks,

	Dave

