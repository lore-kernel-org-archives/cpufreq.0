From: Michael Opdenacker <zumbi3@free.fr>
Subject: Shell script to select the right cpufreq module?
Date: Tue, 30 Mar 2004 21:27:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4069CA25.2080806@free.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq mailing list <cpufreq@www.linux.org.uk>

Hello,

I'm testing Fedora Core 2 test 2 (FC2T2) and cpufreq works just fine! 
Thanks a lot for your good work!

By the way, in FC2T2, you have to set the DRIVER variable in 
/etc/cpuspeed.conf according to your processor (DRIVER=p4-clockmod in my 
case). Otherwise, even if you start the /etc/init.d/cpuspeed script, 
nothing happens.

I would like to automate that so that the /etc/init.d/cpuspeed script 
automatically loads the right cpufreq module if the cpu is supported. If 
users don't want cpu frequency scaling, they just have to disable this 
service at startup.

Does anyone here already have a shell script that reads /proc/cpuinfo 
and returns the name of the corresponding cpufreq module if the 
processor is supported?

Otherwise, I'll start to write one and ask you guys to test it, as I can 
only make tests on P4.

Thank you in advance,

    Cheers,

    Michael.

-- 

Michael Opdenacker
http://opdenacker.org/
