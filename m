From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Problem recognizing P4-M
Date: Wed, 4 May 2005 22:58:54 +0200
Message-ID: <20050504205854.GA6331@isilmar.linta.de>
References: <1114490818.6148.15.camel@petra>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1114490818.6148.15.camel@petra>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Swartz <z3p@twistedmatrix.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Tue, Apr 26, 2005 at 12:46:58AM -0400, Paul Swartz wrote:
> I've checked all over the internet, but I've had no luck finding the
> answer to this problem.  I have what looks to be a Mobile Intel Pentium
> 4 at 2.66Ghz.  It's supported (sort of) by the p4-clockmod and
> acpi-cpufreq modules, but it seems like it should be supported by one of
> the speedstep modules.  However, whenever I try to insert the
> speedstep-ich module, I get this:

speedstep-ich is the only candidate for this CPU. However, it depends on an
Intel chipset being present in your notebook. What does lspci tell you?

	Dominik
