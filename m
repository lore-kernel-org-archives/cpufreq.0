From: Dave Jones <davej@redhat.com>
Subject: Re: [Bug 8671] CPU frequency always on highest frequency after
	wakeup from suspend to disk
Date: Tue, 26 Jun 2007 16:31:21 -0400
Message-ID: <20070626203121.GC14751@redhat.com>
References: <20070626133323.70AED1080F7@picon.linux-foundation.org>
	<1182866228.4249.102.camel@queen.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1182866228.4249.102.camel@queen.suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>, linux@markus-schaub.de

On Tue, Jun 26, 2007 at 03:57:08PM +0200, Thomas Renninger wrote:
 > On Tue, 2007-06-26 at 06:33 -0700, bugme-daemon@bugzilla.kernel.org
 > wrote:
 > > http://bugzilla.kernel.org/show_bug.cgi?id=8671
 > 
 > > ------- Comment #10 from linux@markus-schaub.de  2007-06-26 06:37 -------
 > > Yepp, the patch from Thomas works.
 > 
 > Dave, is this acceptable?
 > If yes, I expect you are going to pick it for the next kernel iteration
 > and people still need to workaround this one in userspace or need to
 > pick up the patch separately?

Yeah, looks like the easiest way to solve that.
Can you mail me a copy off-list, and I'll get to it
as soon as I get back from OLS ?

Thanks,

	Dave

-- 
http://www.codemonkey.org.uk
