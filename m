From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedstep-centrino on merom
Date: Thu, 05 Oct 2006 11:30:51 -0700
Message-ID: <45254F5B.1060805@goop.org>
References: <a868a6918c013439c1f221c66945cbe6@resaca.no-ip.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <a868a6918c013439c1f221c66945cbe6@resaca.no-ip.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johannes Petersson <jp@data-tronic.se>, cpufreq@lists.linux.org.uk

Johannes Petersson wrote:
> Hello there
>
> I've just built a system with a Core 2 Duo T7200 (merom) processor. And the
> reason I write you is cause the speed stepping does not seem to work
> perfectly on this new processor. When I try to load the speedstep-centrino
> module I get the following:
>
> modprobe -v speedstep-centrino
> insmod
> /lib/modules/2.6.15-27-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko
>   
This is a fairly old kernel, and there has been quite a bit of work on 
this area lately.  I'm not actively maintaining speedstep-centrino 
anymore; you should post this to cpufreq@lists.linux.org.uk (cc:'d).

> FATAL: Error inserting speedstep_centrino
> (/lib/modules/2.6.15-27-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko):
> No such device
>
> If I load the acpi-cpufreq module instead it works okay, but the available
> speedstepping frequenzies are only:
> 1200000 1000000 800000 600000
> And since this is a 2 GHz processor I want it to be able to run at 2 GHz as
> well. 
> This problem, I suppose, is probably due to a faulty DSDT reported by the
> bios. 
>
> I would really like to use the speedstep-centrino module instead. I work as
> a C/C++ programmer, so what I did was open the speedstep-centrino.c file in
> the linux source, and from what I can see there there is no support for
> merom (or yonah).
>
> So my question to you is if there is any work beeing done on this module to
> support Core 2 Duo (merom) processors? Or is the recommended way to go, to
> use the acpi-cpufreq instead? Or if you could guide me a little to maybe add
> support for Merom?
>   

    J
