From: John Chia <orange@geek.com>
Subject: speedstep-smi module on Omnibook 6000 (2.6.0-test8)
Date: Sun, 19 Oct 2003 21:04:08 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031020010408.GA2379@beefchickenpork.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

Perhaps someone can help me in my quest to get speedstep working on my
Omnibook 6000.  It contains the 440BX/ZX/DX/MX chipset, so I assumed it
would work with the speedstep-smi module included with Linux.  No, it
doesn't.  This is the output I get when inserting the module:

speedstep-smi: signature:0x00008680, command:0x0000e6f5,
event:0x00000000, perf_level:0x47534943.

Is there anything I can do, probes, utilities or anything, to help
someone determine how to get this working?

Thanks in advance,
Please cc me on replies,
John.

PS. there is a module with support called speedstep-piix4 here:
http://www.poupinou.org/cpufreq/speedstep-piix4.html
