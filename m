From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 16:04:14 +0100
Message-ID: <20051202150414.GF24254@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB60067F3B26@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60067F3B26@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: CPUFreq@lists.linux.org.uk, davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>

On Fri, Dec 02, 2005 at 06:26:52AM -0800, Pallipadi, Venkatesh wrote:
> 
> I think from user perspectibe, P4-clockmod is most confusing driver
> ever. P4-clockmod will only do the duty-cycle based throttling and will
> not save any significant power. In fact, CPU may end up consuming more
> power than without it for a constant amount of unit-work (Dominik has
> patiently explained it quite a few times on this list). It will only
> help in thermal conditions and ACPI throttling driver should handle that
> anyway. Given this: I vote for removing p4-clockmod altogether from
> cpufreq drivers. Dave, Dominik: do you agree?

-1

There is an infrastructure in order to cool the processor with
cpufreq.  Doing what you propose disallow people with such
configurations to use ACPI passive cooling.

I propose instead that we use some sort of flags such
that only cpufreq driver which are able to scale voltages, or
knowns to ofer good power savings, use the policy/governor
stuff.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
