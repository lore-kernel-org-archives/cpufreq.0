From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Coppermine, cpufreq
Date: Thu, 30 Oct 2003 15:09:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031030140910.GH28351@poupinou.org>
References: <3FA11700.8080908@tcpa-info.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FA11700.8080908@tcpa-info.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Hannich <dumb@tcpa-info.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Oct 30, 2003 at 02:49:52PM +0100, Matthias Hannich wrote:
> Hi,
> 
> I have a laptop (Gericom Webboy) with a PIII Coppermine.
> I am working on a 2.4.22-kernel (from kernel.org) and patched the 
> patch-2.4.22-ac4.bz2 from Alan Cox against it.
> 
> Because of having a low battery-capacity I tried to enable cpufreq and 
> ACPI-stuff in the kernel (and tried to compile them as modules as well).
> 

...

> root:/usr/src/linux-2.4.22# insmod speedstep-ich
> Using /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o: 
> unresolved symbol speedstep_get_processor_frequency
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o: 
> unresolved symbol speedstep_detect_processor
> /lib/modules/2.4.22-ac4-486/kernel/arch/i386/kernel/speedstep-ich.o: 
> unresolved symbol speedstep_get_freqs
> 

What about a
modprobe speedstep-ich
instead of insmod?

PS: If modprobe speedstep-ich still  do not work
modpbore speedstep-lib
modprobe speedstep-ich


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
