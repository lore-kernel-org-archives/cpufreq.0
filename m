From: Stefan Frings <stefan.frings@vodafone.de>
Subject: powersave governor
Date: Tue, 3 Aug 2004 19:32:31 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408031932.32276.stefan.frings@vodafone.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: cpufreq@www.linux.org.uk

I just upgraded my kernel 2.4.21 to 2.6.6 because I want to increase battery 
power on my notebook. I habe an external energy monitor attached to the power 
cable of this 
notebook.

My notebook has an Amd Athlon64 3000+ processor. It supports 800, 1600 and 
1800 Mhz clock frequency.

I measured these values for power consumtion:

Kernel 2.4.21                     60W...100W
Kernel 2.6.6 performance    60W...100W
Kernel 2.6.6 powersave       40W..60W

So the newer kernel helped really much to get a longer battery life.

But there is one thing, that I do not understand: In both governor modes 
(performance and powersave) the speed of programs is the same. I tested it 
with:

- Compile linux kernel
- glxgears (a simple graphical benchmark tool without 2D or 3D accelleration)
- fgl_glxgears (the same graphical benchmark tool with 3D Hardware 
accelleration)

The power consumption is really different but the program speed does not 
change. Can you tell me if this is normal?

Output of x86info:

x86info v1.12b.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
Family: 15 Model: 4 Stepping: 8
CPU Model : Athlon 64
Processor name string: AMD Athlon(tm) 64 Processor 3000+
