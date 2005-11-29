From: Dave Jones <davej@redhat.com>
Subject: Re: Wrong frequencies sometimes on Sony Vaio Athlon4
Date: Tue, 29 Nov 2005 14:44:04 -0500
Message-ID: <20051129194404.GE3462@redhat.com>
References: <20051129135423.GA20258@bungled.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051129135423.GA20258@bungled.net>
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
To: Nathan Conrad <conrad@bungled.net>
Cc: cpufreq@lists.linux.org.uk

On Tue, Nov 29, 2005 at 08:54:23AM -0500, Nathan Conrad wrote:
 > Hi,
 > 
 > I have a 1.2 GHz Athlon4 CPU on my Sony Vaio PCG-FXA49 laptop. I use
 > the powernow CPU scaling. Sometimes (a few percent of the time), the
 > driver records my laptop's CPU as the wrong speed. For example, right
 > now the following speeds are available:
 > 
 > 1292256 1076880 861504 646128 538440
 > 
 > The first should be almost exactly 1.2 GHz while the last should be
 > 500 MHz.

They're an approximation. We just report what the BIOS claims
the platform is capable of.

		Dave
