From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: RE: [PATCH] speedstep-centrino: Avoid returning zero freq on
	transient MSR values
Date: Fri, 10 Dec 2004 13:16:24 -0800
Message-ID: <1102713384.686.70.camel@localhost>
References: <88056F38E9E48644A0F562A38C64FB60038B2BFD@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60038B2BFD@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq list <cpufreq@www.linux.org.uk>

On Fri, 2004-12-10 at 10:37 -0800, Pallipadi, Venkatesh wrote:
> Yes. These are Pentium 4 based processsors and with Enhanced Speedstep
> on these processors, tsc rate will not change with CPU frequency change.

Can the Pentium M not also change speed by itself?  The documentation of
the TM2 seems to say that it can.

	J
