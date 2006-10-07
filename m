From: Dave Jones <davej@redhat.com>
Subject: Re: new p4-clockmod capable CPUs
Date: Sat, 7 Oct 2006 14:44:49 -0400
Message-ID: <20061007184449.GD3732@redhat.com>
References: <EB12A50964762B4D8111D55B764A8454B2E6AC@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454B2E6AC@scsmsx413.amr.corp.intel.com>
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
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Sat, Oct 07, 2006 at 06:46:12AM -0700, Pallipadi, Venkatesh wrote:
 
 > >Ah. Thanks. Now only the new Celerons and Xeons confuse me -- they're
 > >family 6, model 14, stepping 8. Is Ap B1 still valid, as they're called
 > >Xeons (and Celerons)?
 > >
 > >I am confused by all these marketing names being re-used and 
 > >re-used and
 > >re-used and re-used.... sorry ;)
 > >
 > 
 > Hmm... That above doc gives MSR details but doesn't seem to say how to
 > identify a Core/Core 2 processor. I had to look for another ref here.
 > http://download.intel.com/design/mobile/SPECUPDT/30922205.pdf
 > Which says as long as family is 0xf and model 0xe, you can assume it to
 > be Core microarch. And model 0xf will be core 2 in a similar way.
 > Irrespective of final marketing name that they may acquire.
 
It's usually handy to look at the x86info source[1], as most of the
time, I've done the head-scratching to figure out stuff like this
already :)

	Dave

[1] http://www.codemonkey.org.uk/projects/x86info/

-- 
http://www.codemonkey.org.uk
