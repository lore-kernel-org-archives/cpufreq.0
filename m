From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 11:41:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414104148.GC24970@redhat.com>
References: <20040414103646.GB8953@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414103646.GB8953@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 12:36:46PM +0200, Bruno Ducrot wrote:
 > Hi Dave,
 > 
 > I think this patch is needed especially if the FSB is around 166MHz or
 > 200MHz, or else I believe we get instabilities on some K7's motherboard
 > powernow capable (it's called Cool'n Quiet IIRC).

Looks good, applied.  It'll turn up in the next -mm.

thanks,

		Dave
