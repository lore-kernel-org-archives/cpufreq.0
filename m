From: Cyril Wattebled <neurowork@free.fr>
Subject: Cpufreq question ...
Date: Thu, 5 Feb 2004 02:05:33 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040205020533.565d7fe6.neurowork@free.fr>
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

Hi there,

I have a centrino 1.7ghz on my sony z1rsp laptop.
On linux, cpufreq works like a charm especially with speedfreqd which throttles
the cpu from 600mhz to 1.7ghz dynamicly.
I have however a question that's in my mind for a long time ...
On M$ windows, the os is able to throttle the cpu down to 200 mhz which is enough
most of the time, and keep the laptop from been too hot.
So I'm wondering why cpufreq detects 600 mhz for a cpu that is able to go below
600mhz. By the way, I'm using enhanced speedstep module. I have tried various other
modules and only p4-clockmod allowed me to throttle the cpu down to 200 mhz but I
heard that p4-clockmod isn't as effective as enhanced speedstep for the power management
since enhanced speedstep changes voltage values.
So is there a way to tweak cpufreq to allow the cpu to be throttled at a lower speed ?

Regards,

Cyril
