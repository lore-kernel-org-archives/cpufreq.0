From: Dominik Brodowski <linux@brodo.de>
Subject: Re: CHOWN PB
Date: Sun, 28 Sep 2003 13:53:50 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030928115350.GA9717@brodo.de>
References: <3F6A35D7.8070605@wanadoo.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F6A35D7.8070605@wanadoo.fr>
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
To: Toula Michael <keos@wanadoo.fr>
Cc: cpufreq@www.linux.org.uk

On Fri, Sep 19, 2003 at 12:46:47AM +0200, Toula Michael wrote:
> Hi,
> Ok here is the deal :
> I would like to allow users from a given group (let say the cpufreq 
> group) to have write acces to /proc/cpufreq and 
> /proc/sys/cpu/0/speed...I try the following :
> 
> $ chown root:cpufreq /proc/cpufreq
> $ chmod 664 /proc/cpufreq
> And then...
> $ ls -l /proc/cpufreq
> ...show me that nothing changes.
> 
> Any idea on how to solve this problem ? Because login as root every time 
> I want to change the frequency is quite boring ( I would like to be able 
> to use button of my window manager to change it), and because of that 
> other people that use my laptop can change the frequency because they 
> don't have the root passwd...
> Thx in advance...
> Mike

man 8 sudo

	Dominik
