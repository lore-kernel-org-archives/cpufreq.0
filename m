From: Toula Michael <keos@wanadoo.fr>
Subject: CHOWN PB
Date: Fri, 19 Sep 2003 00:46:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F6A35D7.8070605@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,
Ok here is the deal :
I would like to allow users from a given group (let say the cpufreq 
group) to have write acces to /proc/cpufreq and 
/proc/sys/cpu/0/speed...I try the following :

$ chown root:cpufreq /proc/cpufreq
$ chmod 664 /proc/cpufreq
And then...
$ ls -l /proc/cpufreq
...show me that nothing changes.

Any idea on how to solve this problem ? Because login as root every time 
I want to change the frequency is quite boring ( I would like to be able 
to use button of my window manager to change it), and because of that 
other people that use my laptop can change the frequency because they 
don't have the root passwd...
Thx in advance...
Mike
