From: Andrew Morton <akpm@osdl.org>
Subject: Re: 2.6.16-rc5-mm3 -- initcall at 0xc1325736:
 acpi_cpufreq_init+0x0/0x71(): returned with error code -16
Date: Thu, 9 Mar 2006 13:08:47 -0800
Message-ID: <20060309130847.05d94ede.akpm@osdl.org>
References: <a44ae5cd0603090914vfaaf439m448db90c9b732ff0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <a44ae5cd0603090914vfaaf439m448db90c9b732ff0@mail.gmail.com>
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
To: Miles Lane <miles.lane@gmail.com>
Cc: cpufreq@lists.linux.org.uk

"Miles Lane" <miles.lane@gmail.com> wrote:
>
>  I get this when I boot:
>  initcall at 0xc1325736: acpi_cpufreq_init+0x0/0x71(): returned with
>  error code -16
>  Is this a problem?

Nope, this is acpi_cpufreq saying "hey, you already installed a cpufreq
driver - what are you asking me to do it for?".
