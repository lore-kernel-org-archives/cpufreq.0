From: Simon Cooper <thecoop@runbox.com>
Subject: cpufreq segfaults when network cable plugged in
Date: Mon, 12 Apr 2004 00:43:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040412004335.5995e422.thecoop@runbox.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

right, this is very strange, cpufreq (compiled into the kernel) segfaults whenever the network cable on my laptop is plugged in on bootup but boots ok when it is plugged in after the kernel has loaded. i can post the entire segfault msg but it'll need me to write it all down. driver is 'r8139' (1000Mbps card), kernel version 2.6.5-mm2

Simon Cooper 
