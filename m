From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] speedstep-smi: only allow it to run on mobile Intel
	Pentium III
Date: Fri, 3 Sep 2004 21:24:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903202410.GQ26419@redhat.com>
References: <20040903160043.GA8523@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040903160043.GA8523@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Fri, Sep 03, 2004 at 06:00:43PM +0200, Dominik Brodowski wrote:
 > speedstep-smi only makes sense on Intel mobile Pentium III systems.
 > So, unify the distributed checks for speedstep_processor there,
 > and disallow P4s.
 > 
 > Signed-off-by: Dominik Brodowski <linux@brodo.de>
 > 
 >  arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   25 ++++++++++++-------------
 >  1 files changed, 12 insertions(+), 13 deletions(-)

Applied.

 > +	switch (speedstep_processor) {
 > +	case SPEEDSTEP_PROCESSOR_PIII_T:
 > +        case SPEEDSTEP_PROCESSOR_PIII_C:
 > +        case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
 > +		break;

Careful with indentation 8-)  I fixed this up..

		Dave
