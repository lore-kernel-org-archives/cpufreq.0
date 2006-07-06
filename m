From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Frequency changes for XScale PXA255
Date: Thu, 6 Jul 2006 18:08:59 +0200
Message-ID: <20060706160859.GA5441@isilmar.linta.de>
References: <b6cb966c0607060232k40b87efrd51c9bbdbaf8a105@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <b6cb966c0607060232k40b87efrd51c9bbdbaf8a105@mail.gmail.com>
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
To: Miroslav Vasic <miroslav.vasic@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Thu, Jul 06, 2006 at 11:32:07AM +0200, Miroslav Vasic wrote:
> starts executing, there is a message that it is not possible to continue
> because of the line BUG_ON(irqs_disabled()); This line is in the function
> cpufreq_notify_transition. It is obvious that it is because interrupts are
> disabled, and I tried to enable interrupts before calling the function
> __cpufreq_driver_target,

Something strange is going on, or else your "thread" would run with IRQs
enabled. Could you post the code, please?

	Dominik
