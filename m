From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq-nforce2 divider
Date: Mon, 5 Jun 2006 15:24:46 -0400
Message-ID: <20060605192446.GE30336@redhat.com>
References: <44831B78.6050407@hasw.net> <20060604234249.GB2823@redhat.com>
	<448483A1.7090404@hasw.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <448483A1.7090404@hasw.net>
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
To: Sebastian Witt <hasw@hasw.net>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jun 05, 2006 at 09:18:57PM +0200, Sebastian Witt wrote:
 > Dave Jones wrote:
 > >
 > >Ok, but for the sake of the changelog, can you explain why
 > >this is a good thing ?
 > >
 > 
 > Alexander Choporov reported (06/01/06) that xdiv = 1 does not work on his 
 > Abit NF7S2. Although there shouldn't be much cases that lead to xdiv = 1.

Ok, I've applied this by hand as your patch was badly whitespace damaged
(Every tab had been converted to spaces in your diff)

Please make sure that doesn't happen for future diffs.

Thanks,

		Dave

-- 
http://www.codemonkey.org.uk
