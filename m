From: Alexander Bokovoy <ab@altlinux.org>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Wed, 22 Oct 2003 00:53:28 +0300
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021215327.GH3133@sam-solutions.net>
References: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
	<yw1xbrsaeu44.fsf@kth.se> <20031021203037.GB3133@sam-solutions.net>
	<yw1xoewaiavf.fsf@kth.se> <20031021211119.GE3133@sam-solutions.net>
	<yw1xfzhmi86r.fsf@kth.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1xfzhmi86r.fsf@kth.se>
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
To: M?ns Rullg?rd <mru@kth.se>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Tue, Oct 21, 2003 at 11:37:16PM +0200, M?ns Rullg?rd wrote:
> Alexander Bokovoy <ab@altlinux.org> writes:
> 
> >> What's your /proc/cpuinfo?  Mine says
> >> 
> >> processor	: 0
> >> vendor_id	: GenuineIntel
> >> cpu family	: 15
> >> model	: 2
> >> model name	: Mobile Intel(R) Pentium(R) 4 - M CPU 1.80GHz
> >> stepping	: 7
> 
> > As I said, it is Centrino-based, with 1.3GHz Pentium M:
> >
> > processor	: 0
> > vendor_id	: GenuineIntel
> > cpu family	: 6
> > model		: 9
> > model name	: Intel(R) Pentium(R) M processor 1300MHz
> > stepping	: 5
> 
> So, mine won't work, or what?
If you can boot into 2.4.22 or .23pre with ACPI enabled and can see
/proc/acpi/processor/CPU0/performance, then your processor should be
supported by speedstep-ich or speedstep-piix4 modules (don't know which
one exactly).
-- 
/ Alexander Bokovoy
Samba Team                      http://www.samba.org/
ALT Linux Team                  http://www.altlinux.org/
Midgard Project Ry              http://www.midgard-project.org/
