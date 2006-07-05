From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] return error when failing to set minfreq
Date: Wed, 5 Jul 2006 17:21:22 -0400
Message-ID: <20060705212122.GA11210@redhat.com>
References: <20060705211220.GE13602@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060705211220.GE13602@inferi.kami.home>
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
Content-Transfer-Encoding: 7bit
To: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.de>, davej@codemonkey.org.uk

On Wed, Jul 05, 2006 at 11:12:20PM +0200, Mattia Dongili wrote:

 > I'm resending this patch that probably has been lost in deep space.
 > It got the signed-off by Dominik before:
 > http://lists.linux.org.uk/mailman/private/cpufreq/2006-June/005916.html
 > The same message contains a detailed explanation of the problem it
 > fixes.
 > Rediffed against 2.6.17-mm6.

Applied.
(After de-MIME'ing your mail by hand, which is possibly why it got
 dropped last time, though I usually send out grumbles when that happens
 as git-applymbox barfs on MIMEs.)

		Dave

-- 
http://www.codemonkey.org.uk
