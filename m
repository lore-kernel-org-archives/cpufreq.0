From: Thomas Renninger <trenn@suse.de>
Subject: Re: [Bug 8671] CPU frequency always on highest frequency after
	wakeup from suspend to disk
Date: Tue, 26 Jun 2007 15:57:08 +0200
Message-ID: <1182866228.4249.102.camel@queen.suse.de>
References: <20070626133323.70AED1080F7@picon.linux-foundation.org>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20070626133323.70AED1080F7@picon.linux-foundation.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>, linux@markus-schaub.de

On Tue, 2007-06-26 at 06:33 -0700, bugme-daemon@bugzilla.kernel.org
wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=8671

> ------- Comment #10 from linux@markus-schaub.de  2007-06-26 06:37 -------
> Yepp, the patch from Thomas works.

Dave, is this acceptable?
If yes, I expect you are going to pick it for the next kernel iteration
and people still need to workaround this one in userspace or need to
pick up the patch separately?

Thanks,

   Thomas
