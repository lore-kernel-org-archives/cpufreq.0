From: Johannes Graumann <johannes_graumann@web.de>
Subject: Crusoe and 2.6.1 confusion
Date: Fri, 23 Jan 2004 18:07:41 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040123180741.4e7f8452.johannes_graumann@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hello,

I'm trying to optimize my 2.6.1 home grown kernel for my fujitsu life
book, which runs from a Transmeta Crusoe processor. I have learned from
the debian-laptop list, that this processor doesn't need any Governor or
cpufreqd, since it does the job by default.
In my .config I have the following flags set:
CPU_FREQ
X86_LONGRUN

CPU_FREQ_DEFAULT_GOV_PERFORMANCE is set as a default - even if the
Crusoe doesn't need a Governor, I can't get rid of this.

Is this all I need? Will this create the interface that longrun will
interact with?

Please help the confused!

Joh
