From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Mon, 9 Aug 2004 16:53:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809145305.GA10792@dominikbrodowski.de>
References: <1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040807132449.GA9569@dominikbrodowski.de>
	<1091905423.29221.1.camel@pc>
	<20040808162408.GA7986@dominikbrodowski.de>
	<1092058666.29221.50.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1092058666.29221.50.camel@pc>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Mon, Aug 09, 2004 at 09:37:46AM -0400, Brian J. Murrell wrote:
> On Sun, 2004-08-08 at 18:24 +0200, Dominik Brodowski wrote:
> > 
> > Problem is, I don't use the resume funcitonality on my notebook
> 
> But surely lots of people are.  If the patch below were necessary and
> correct, would not a lot more people be having the same problem?

Not necessarily. Bugs are sometimes very difficult to trigger.

> Unless
> I am mis-understanding the intent of the patch.  Do you mean it as a
> further test/confirmation that write_seqlock_irq() is the culprit or do
> you mean the patch as the solution to my problem?

It's actually a try for a solution.

Thanks,
	Dominik
