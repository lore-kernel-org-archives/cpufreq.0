From: Federico Flego <flego.federico@gmail.com>
Subject: ondemand governor hangs up on my Dell 5150
Date: Thu, 28 Jun 2007 20:44:06 +0200
Message-ID: <46840176.6050502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=OZ92+M+PCpdwCy/YQ4Hx02No1rw9FXrKG065lLFTFdGp+QdfpYIswetm607X8GOY+PX+ox0YvaRIal12ur8oAvZlk7WleK40C9br9/aON+ZcC9OuQj3pcDuMgZRm776B5iNi+LEPH1/qF5r+LJ5qKuqDDsrFrW3Uln1PLZOtT3M=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi all!

I'm new to this list and I'd like to have your feedback on the following 
problem I'm experimenting and which is starting to annoying me very much!

After compiling a new kernel with cpu frequency scaling capabilities 
activated my system execute the following script at boot time:

echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
/usr/bin/i8kfan 0 0 (*)

And finally, I have my laptop quiet and with low battery consuption at 
least when I write e-mail read newspaper on line! :)

The problem is that now and then the computer hangs and there's no way 
to reboot it but holding down the power-off button... thus losing any 
unsaved data and having to wait for a whole disk error checking at next 
boot! :(

This problem is sort of repeatable, in fact whenever I launch mplayer 
the machine hangs up immediately 90% of the times.

I thought a kernel upgrade can solve the problem, but kernel 2.6.21.5 
didn't fix it!

Can you tell me whether you experimented similar problem? And how you 
solved it in case? Or can you help me to understand what is the possible 
cause?

My laptop is a Dell Inspiron 5150 with:

cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4     CPU 3.06GHz
stepping        : 9
cpu MHz         : 3066.590

and os is:

Linux gardelito 2.6.21.5-ARCH #1 SMP Tue Jun 19 19:43:55 CEST 2007 i686 
Mobile Intel(R) Pentium(R) 4     CPU 3.06GHz GenuineIntel GNU/Linux


Thank you very very much for any help/hints you can provide...


Federico.


(*) I found out that if I stop the fan this way at boot time, then it is 
started/tuned/stopped depending on cpu temperature, otherwise it is kept 
speed controlled but never stopped.
