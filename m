From: Pavel Machek <pavel@suse.cz>
Subject: Re: [ACPI] [PATCHES] ACPI Processor update [idle, throttling,
	thermal, cpufreq]
Date: Mon, 8 Sep 2003 15:29:40 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030908132939.GD3944@openzaurus.ucw.cz>
References: <20030904222434.GC6350@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030904222434.GC6350@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: acpi-devel@lists.sourceforge.net, andrew.grover@intel.com, cpufreq@www.linux.org.uk

Hi!

>http://www.brodo.de/cpufreq_tmp/acpi-2.6.0-test4-processor_thermal_cpufreq
> 	Use _any_ CPUfreq driver for passive cooling. Implemented by an
> 	cpufreq policy notifier and cpufreq_update_policy.
>  

Good - it is going to help a lot on k8 notebooks.

http://www.brodo.de/cpufreq_tmp/acpi-2.6.0-test4-processor_thermal_throttling
> 	Move throttling into its own submodule, and register it with the new
> 	passive cooling module. Also, the now-useless "limit" interface is
> 	removed.
> 

Actually I liked to be able to echo 0:7 > limit and conserve battery/
make sure machine does not overheat  with it...


-- 
				Pavel
Written on sharp zaurus, because my Velo1 broke. If you have Velo you don't need...
