From: Marc Singer <elf@buici.com>
Subject: Athlon 64 complains of frequency mismatch
Date: Fri, 18 Jun 2004 11:51:03 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040618185103.GA14909@buici.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Below is the dmesg output from the powernow driver. I'd be glad to
patch the driver to fix&test if you can give me some indication as to
where to look for the trouble.

Cheers.

powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid freq entries 3300000 kHz vs. 2147483048 kHz
powernow-k8: invalid powernow_table
