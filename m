From: Dave Jones <davej@redhat.com>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Tue, 2 Jan 2007 12:36:01 -0500
Message-ID: <20070102173601.GD7656@redhat.com>
References: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
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
To: jorgen@greven.dk
Cc: cpufreq@lists.linux.org.uk

On Tue, Jan 02, 2007 at 01:17:05PM +0100, jorgen@greven.dk wrote:
 > Hi
 > 
 > I have just bought a nice little sbc mainboard with a Via C7 cpu. It run
 > Centos with stock kernel 2.6.19.1 that I downloaded and installed a few
 > days ago.
 > But cpufreq does not work.
 > 
 > Can I in some way help with testing/debugging the cpufreq driver (centrino
 > or longhaul?) for this cpu?

The C7 works fine with acpi-cpufreq if the correct BIOS tables are present.
Support *could* be added to speedstep-centrino to use hardcoded tables
for these CPUs for systems where the BIOSes lack them, but hasn't been
done yet.

Given speedstep-centrino is due to be obsoleted by acpi-cpufreq at some stage,
the feature of using hardcoded tables probably needs to be added to
acpi-cpufreq at some point too.

		Dave

-- 
http://www.codemonkey.org.uk
