From: jorgen@greven.dk
Subject: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Wed, 3 Jan 2007 11:22:21 +0100 (CET)
Message-ID: <14588.195.215.10.251.1167819741.squirrel@195.41.226.86>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

>On Tue, Jan 02, 2007 at 11:16:49PM +0100, jorgen at greven.dk wrote:

> > # dmesg
> > acpi_cpufreq: disagrees about version of symbol
acpi_processor_notify_smm acpi_cpufreq: Unknown symbol
acpi_processor_notify_smm

>Looks like a miscompiled module somehow.
>
>		Dave
>
Why that - it's stock code from kernel.org?

Can you point me to:
1) info on how to debug a module
2) some specs on the acpi / cpu frequency parts

Brgds Jorgen
