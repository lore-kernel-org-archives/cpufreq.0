From: Mattia Dongili <dongili@supereva.it>
Subject: Re: sysfs cpufreq missing in 2.6.0
Date: Tue, 23 Dec 2003 17:49:53 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031223164953.GN951@inferi.kami.home>
References: <3FE86F70.8060908@psu.edu>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FE86F70.8060908@psu.edu>
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

On Tue, Dec 23, 2003 at 11:38:08AM -0500, Nirmal Govind wrote:
> Hi,
> 
> I compiled the 2.6.0 kernel (released on Dec. 18, downloaded from 
> kernel.org) with the options enabled for userspace cpufreq.. the 
> documentation says that sysfs will be used however I do not have any 
> such device in /proc/sys/ or in /. I enabled the /proc/cpufreq so I 
> do see a /proc/cpufreq but nothing similar to 

sysfs is not procfs :)
take look at Documentation/filesystems/sysfs.txt in your kernel tree

bye
-- 
mattia
:wq!
