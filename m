From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Pentium III ( Coppermine)
Date: Sun, 12 Jun 2005 09:42:04 +0200
Message-ID: <20050612074204.GE15680@isilmar.linta.de>
References: <20050612041516.43517.qmail@web54709.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050612041516.43517.qmail@web54709.mail.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alaios <alaios@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

Please compile your kernel with CONFIG_CPUFREQ_DEBUG enabled and boot with
the boot parameter cpufreq.debug=2 and post the dmesg output.

Thanks,
	Dominik
