From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: ondemand governor
Date: Fri, 24 Sep 2004 16:27:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040924142711.GE5746@message-id.gmane0305.slipkontur.de>
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

Hi,
i finally tried the ondemand governor. Short: i wasn't very impressed :-)
I ran it on a Dell D600 with 1700mhz pentium M (banias)
The problem was: it always switched to the higher frequencies, even if the 
system was mostly idle (~5-10%). gkrellm (there is a nice cpufreq plugin for
it...) showed me that the switchup often occured when accessing the disk
(reiserfs / flushing buffers every 5 seconds).
Slower sample rate made it a bit better but still far from being good and
reacting veeeeerryyyyyy ssssllllllooooooowwwwwww. 
So i tried setting higher tresholds (default 80). Didn't help. If i set
it higher than 95, it would not switch up at all. Lower than 95 it still
would switch up even with virtually no load.
So i am back to the userspace governor and the SUSE powersaved which works
pretty well wrt cpufreq switching.
If i get some time (not in the next two weeks...) i will take a look at
incorporating the algorithms we have put into powersaved into the ondemand
governor.
-- 
Stefan Seyfried
