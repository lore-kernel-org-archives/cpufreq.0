From: linux@brodo.de
Subject: Re: [ACPI] [PATCHES] ACPI Processor update [idle, throttling,
	thermal, cpufreq]
Date: Tue, 9 Sep 2003 19:21:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030909172135.GA4106@brodo.de>
References: <20030904222434.GC6350@brodo.de>
	<20030908132939.GD3944@openzaurus.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030908132939.GD3944@openzaurus.ucw.cz>
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
To: Pavel Machek <pavel@suse.cz>
Cc: acpi-devel@lists.sourceforge.net, andrew.grover@intel.com, cpufreq@www.linux.org.uk

Hi Pavel,

Glad you liked [at least parts] of my patches.

On Mon, Sep 08, 2003 at 03:29:40PM +0200, Pavel Machek wrote:
> http://www.brodo.de/cpufreq_tmp/acpi-2.6.0-test4-processor_thermal_throttling
> > 	Move throttling into its own submodule, and register it with the new
> > 	passive cooling module. Also, the now-useless "limit" interface is
> > 	removed.
> > 
> 
> Actually I liked to be able to echo 0:7 > limit and conserve battery/
> make sure machine does not overheat  with it...

echo 7 > throttling should do the same thing. However, don't expect any
battey conservation if ACPI C2 throttling works, and to set custom levels
against "overheating" there's a write access to
/proc/acpi/thermal/*/trip_points too...

	Dominik
