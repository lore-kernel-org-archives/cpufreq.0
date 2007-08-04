From: Dave Jones <davej@redhat.com>
Subject: Re: freq scaling
Date: Fri, 3 Aug 2007 20:28:16 -0400
Message-ID: <20070804002816.GA19845@redhat.com>
References: <1186181309.4002.4.camel@XANJTLTGL>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1186181309.4002.4.camel@XANJTLTGL>
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
To: Xandros Desktop OS User <jtltgl@sbcglobal.net>
Cc: cpufreq@lists.linux.org.uk

On Fri, Aug 03, 2007 at 06:48:28PM -0400, Xandros Desktop OS User wrote:
 > hi i have a amd k6 3 and kernel 2.6.18 . I am trying to get freq scaling
 > on my machine. Is this the program needed to give freq scaling.

If you have a mobile version of the K6-3 (model 13 in /proc/cpuinfo)
then the powernow-k6 driver will work.  It's literally been about
5 years since I last heard of someone using it, but it's hardly changed
in that time, so should still work.

	Dave

-- 
http://www.codemonkey.org.uk
