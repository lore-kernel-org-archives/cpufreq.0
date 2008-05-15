From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Intel Celeron M 530 cpu not recognized by cpufreq nor p4_clockmod
Date: Thu, 15 May 2008 13:07:04 +0200
Message-ID: <20080515110704.GA8932@dominikbrodowski.net>
References: <15643306.1207386278296.JavaMail.root@ps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <15643306.1207386278296.JavaMail.root@ps13>
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
To: "adaca@tiscali.it" <adaca@tiscali.it>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sat, Apr 05, 2008 at 11:04:38AM +0200, adaca@tiscali.it wrote:
> on my new Toshiba A20 laptop I've never been able to see cpufreq working, so the cpu is always at max speed (1.73GHz); this applies to kernel 2.6.23 on both Ubuntu 7.10 and Fedora 8, and now 2.6.24 on Fedora (2.6.24.4-64.fc8).
> This post says I need the p4_clockmod driver: 
> http://lists.opensuse.org/opensuse-bugs/2008-03/msg05714.html

Well, the p4 clockmod driver is only useful in rare corner cases unlikely to
be relevant on your system, and the hardware you own (Celeron) doesn't
support proper CPU frequency scaling.

	Dominik
