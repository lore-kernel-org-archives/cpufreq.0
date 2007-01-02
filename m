From: Dave Jones <davej@redhat.com>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Tue, 2 Jan 2007 17:27:39 -0500
Message-ID: <20070102222739.GB18033@redhat.com>
References: <35957.192.168.3.96.1167776209.squirrel@www.jgnet.dk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <35957.192.168.3.96.1167776209.squirrel@www.jgnet.dk>
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
Content-Transfer-Encoding: 7bit
To: jorgen@greven.dk
Cc: cpufreq@lists.linux.org.uk

On Tue, Jan 02, 2007 at 11:16:49PM +0100, jorgen@greven.dk wrote:

 > # dmesg
 > acpi_cpufreq: disagrees about version of symbol acpi_processor_notify_smm
 > acpi_cpufreq: Unknown symbol acpi_processor_notify_smm

Looks like a miscompiled module somehow.

		Dave

-- 
http://www.codemonkey.org.uk
