From: Dominik Brodowski <linux@brodo.de>
Subject: move kernel/cpufreq.c to drivers/cpufreq/cpufreq.c?
Date: Mon, 14 Jul 2003 18:55:51 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030714165551.GA1925@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Back in the early days the whole cpufreq core was located in one file --
kernel/cpufreq.c. Now, there are several cross-architecture files for
cpufreq present in drivers/cpufreq. Because of this, I'd favor moving 
kernel/cpufreq.c to drivers/cpufreq/cpufreq.c.

Also, cpufreq.c could be split up into "notifiers.c" and "cpufreq.c" --
cpufreq.c can be "modularized" then. It only needs to be "y" on ARM_SA11?0
and if CONFIG_ACPI_PROCESSOR="y" is (on x86). Is there interest in a patch
for this, too?

	Dominik
