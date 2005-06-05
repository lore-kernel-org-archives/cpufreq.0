From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: speedstep_smi module loads randomly.
Date: Sun, 5 Jun 2005 18:56:52 +0200
Message-ID: <20050605165652.GA12338@dominikbrodowski.de>
References: <42A20FCF.4070904@neggie.net>
	<200506050050.32815.fredrik.eriksson@mudsphere.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200506050050.32815.fredrik.eriksson@mudsphere.net>
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
To: Fredrik Eriksson <fredrik.eriksson@mudsphere.net>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sun, Jun 05, 2005 at 12:50:32AM +0200, Fredrik Eriksson wrote:
> this is not a real issue since its working.. but i wanted to know why it does 
> like this:

Could you enable CPUFREQ_DEBUG in the kernel config, please, and add
"cpufreq.debug=2" to the kernel command line, and send me the dmesg output
of (failed) attempts to load speedstep_smi? I'm curious as to _where_ it
fails to load. And, of course, I'm not able to reproduce it locally...

Thanks,
	Dominik
