From: Ben Kevan <ben.kevan@gmail.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable
	Enchanced SpeedStep
Date: Mon, 19 Jun 2006 18:07:13 -0700
Message-ID: <200606191807.14091.ben.kevan@gmail.com>
References: <200606191610.40597.ben.kevan@gmail.com>
	<20060619231323.GC17134@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060619231323.GC17134@redhat.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, linux@brodo.de

Hi Dave, 

Thanks for the awesome speed reply. I have not yet tried with 2.6.17, I will 
have to find the SuSE Kernel Patches to see if I can install vanilla kernel 
then SuSE patch it, and log on. 

You wouldn't happen to know where they are located off the top of your head 
would you? If not, no worries, I can find them. Is there a known broken 
cpufreq issue in 2.6.16.x ? that would possibly cause this speedstep issue? 

I'll try to get back to you tomorrow with the results of 2.6.17 if I can 
figure out how to install the Vanilla Kernel into SuSE10.1

Ben

On Monday 19 June 2006 16:13, Dave Jones wrote:
> On Mon, Jun 19, 2006 at 04:10:40PM -0700, Ben Kevan wrote:
>  > Hi,
>  >
>  > I copied both on this because I thought you both may be interested. My
>  > problem is, my Toshiba Tecra M1 will only run at 598Mhz, and I can not
>  > use toshutils or anything else to configure speedstep to run higher. Or
>  > in any other way can I use it to run higher.
>  >
>  > Below are a bunch of commands to give you an idea of what's going on. Is
>  > this a bug with the 2.6.16.x build? Or is it something else that I am
>  > just oblivious too (ACPI?).
>  >
>  > Any information would be greatly appreciated.
>  >
>  > LSHESU01004839:/home/bkevan # dmesg | grep speedstep
>  > speedstep-centrino: couldn't enable Enhanced SpeedStep
>  > speedstep-centrino: couldn't enable Enhanced SpeedStep
>  > speedstep-centrino: couldn't enable Enhanced SpeedStep
>  > speedstep-centrino: couldn't enable Enhanced SpeedStep
>  >
>  > LSHESU01004839:/home/bkevan # modprobe speedstep_centrino
>  > FATAL: Error inserting speedstep_centrino
>  > (/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/sp
>  >eedstep-centrino.ko): No such device
>  > LSHESU01004839:/home/bkevan # modprobe acpi_cpufreq
>  > FATAL: Error inserting acpi_cpufreq
>  > (/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/ac
>  >pi-cpufreq.ko): No such device
>
> Does this still happen in 2.6.17 ?
> If so, can you boot with cpufreq.debug=7 and post the output of dmesg here
> ?
>
> Thanks,
>
> 		Dave
