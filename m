From: =?iso-8859-1?q?Michael_Teichgr=E4ber?= <mt@wmipf.in-berlin.de>
Subject: Re: /proc/sys/cpu interface and elanfreq on linux 2.4.20
Date: Wed, 17 Sep 2003 13:56:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <873cevtyq0.fsf@wmipf.in-berlin.de>
References: <87znh4e0l2.fsf@wmipf.in-berlin.de> <3F682891.6080600@wanadoo.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3F682891.6080600@wanadoo.fr> (Toula Michael's message of "Wed,
	17 Sep 2003 11:25:37 +0200")
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

Toula Michael <keos@wanadoo.fr> writes:

> In fact you just forgot to activate it. To do so (you must be root):
> $ echo -n "0%0%100%userspace" > /proc/cpufreq

Thanks, this made it work.

-- 
Michael
