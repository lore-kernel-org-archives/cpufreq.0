From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Cpufrequency requirements
Date: Fri, 28 Jan 2005 18:08:05 +0100
Message-ID: <20050128170804.GA7878@dominikbrodowski.de>
References: <20050128154536.8397.qmail@web54705.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050128154536.8397.qmail@web54705.mail.yahoo.com>
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

On Fri, Jan 28, 2005 at 07:45:36AM -0800, Alaios wrote:
> model name      : Intel(R) Celeron(R) CPU 2.40GHz

Intel Celerons don't support frequency scaling, but frequency throttling.
All you can do is use the "p4-clockmod" driver, but it is of limited use in
your case.

> I am running the 2.6.10 linux kernel. Plz tell me what
> parameters i should enable in the kernel for making
> cpufreq a nice experience to share

CONFIG_CPU_FREQ
CONFIG_CPU_FREQ_TABLE
CONFIG_X86_P4_CLOCKMOD

In your case, I'd use the performance governor and limit
/sys/devices/system/cpu/cpu0/scaling_max_freq depening on system
temeperature to avoid the fan being enabled/increased. There are userspace
daemons out there which allow for doing so.

	Dominik
