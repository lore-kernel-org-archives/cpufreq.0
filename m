From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq - totally confused
Date: Tue, 11 Jan 2005 13:48:25 +0100
Message-ID: <20050111124825.GA25782@dominikbrodowski.de>
References: <20050111121423.GA7426@rhea>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050111121423.GA7426@rhea>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Torsten Wolf <t.wolf@tu-bs.de>
Cc: cpufreq@www.linux.org.uk

Hi,

> cpmpiled into the kernel and cpudynd I had two frequencies: 600MHz and
> 1.5GHz. Yesterday, while configuring the ACPI stuff gkrellm showed
> various other frequencies that seemed to correspond to the 8 throttling
> stages indicated in /proc/acpi/processor/CPU/throttling. Unfortunately,
> this nice behaviour somehow got lost and I am desperately trying to get
> it back.

No, you don't really want that back. Throttling doesn't save you much (or
anything); you want frequency and voltage scaling instead. And as ACPI only
seems to export two such states, you should set

> CONFIG_X86_ACPI_CPUFREQ=m
to n and 
> CONFIG_X86_SPEEDSTEP_CENTRINO=m
> CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
to n as well.

	Dominik
