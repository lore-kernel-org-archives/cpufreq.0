From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Speedstep on Intel Pentium M
Date: Wed, 2 Jun 2004 14:42:04 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602124204.GB9210@dominikbrodowski.de>
References: <5069769.1086059486121.SLOX.WebMail.wwwrun@thor.yiti.intern>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <5069769.1086059486121.SLOX.WebMail.wwwrun@thor.yiti.intern>
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
To: Frank Doege <frank@network-steps.de>
Cc: cpufreq@www.linux.org.uk, Francesco Poli <frx@firenze.linux.it>

On Tue, Jun 01, 2004 at 05:11:26AM +0200, Frank Doege wrote:
> Morning,
> 
> thanks for your fast answering. I have an IBM X40 with Pentium 
> M ULV, when i run Windows i can work over 8 ours but only 6 with
> linux. Does the Centrino Driver offers voltage scaling ?

Yes.

So far, though, Linux doesn't put the CPU into idle mode C4 when the system
is not used -- a fix for that is not far away. Search bugzilla.kernel.org
for patches.

	Dominik
