From: Ivor Hewitt <ivor@ivor.org>
Subject: starting governor ondemand failed
Date: Mon, 04 Apr 2005 11:42:19 +0100
Message-ID: <42511A0B.1070008@ivor.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@ZenII.linux.org.uk

Hi,
I was trying to have a play with the ondemand governor but I just get 
the following logged when I try to switch to it:-

cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 2
userspace: managing cpu 0 stopped
cpufreq-core: __cpufreq_governor for CPU 0, event 1
cpufreq-core: starting governor ondemand failed
cpufreq-core: __cpufreq_governor for CPU 0, event 1

This is on a PIIIM using the speedstep-smi interface.
The cpu is only capable of switching between two frequencies, would this 
prevent ondemand starting up?

Regards,

-- 
Ivor
http://www.ivor.it
