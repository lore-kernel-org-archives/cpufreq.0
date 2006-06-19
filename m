From: Dave Jones <davej@redhat.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable
	Enchanced SpeedStep
Date: Mon, 19 Jun 2006 19:13:23 -0400
Message-ID: <20060619231323.GC17134@redhat.com>
References: <200606191610.40597.ben.kevan@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200606191610.40597.ben.kevan@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Ben Kevan <ben.kevan@gmail.com>
Cc: cpufreq@lists.linux.org.uk, linux@brodo.de

On Mon, Jun 19, 2006 at 04:10:40PM -0700, Ben Kevan wrote:
 > Hi, 
 > 
 > I copied both on this because I thought you both may be interested. My problem 
 > is, my Toshiba Tecra M1 will only run at 598Mhz, and I can not use toshutils 
 > or anything else to configure speedstep to run higher. Or in any other way 
 > can I use it to run higher.  
 > 
 > Below are a bunch of commands to give you an idea of what's going on. Is this 
 > a bug with the 2.6.16.x build? Or is it something else that I am just 
 > oblivious too (ACPI?). 
 > 
 > Any information would be greatly appreciated.
 > 
 > LSHESU01004839:/home/bkevan # dmesg | grep speedstep
 > speedstep-centrino: couldn't enable Enhanced SpeedStep
 > speedstep-centrino: couldn't enable Enhanced SpeedStep
 > speedstep-centrino: couldn't enable Enhanced SpeedStep
 > speedstep-centrino: couldn't enable Enhanced SpeedStep
 > 
 > LSHESU01004839:/home/bkevan # modprobe speedstep_centrino
 > FATAL: Error inserting speedstep_centrino 
 > (/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko): 
 > No such device
 > LSHESU01004839:/home/bkevan # modprobe acpi_cpufreq
 > FATAL: Error inserting acpi_cpufreq 
 > (/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): 
 > No such device
 > 

Does this still happen in 2.6.17 ?
If so, can you boot with cpufreq.debug=7 and post the output of dmesg here ?

Thanks,

		Dave

-- 
http://www.codemonkey.org.uk
